#!/usr/bin/python

import feedparser
import re

#
# Count words in rss feed
#
def getwordcounts(url):
    d = feedparser.parse(url)
    wc = {}

    for e in d.entries:
        if 'summary' in e: summary=e.summary
        else: summary=e.description

        words = getwords(e.title + ' ' + summary)
        for word in words:
            wc.setdefault(word,0)
            wc[word] += 1
    return d.feed.title,wc

#
# Delete unuseful character and split words
#
def getwords(html):
    txt = re.compile(r'&amp;lt;[^&amp;gt;]+&amp;gt;').sub('',html)
    words = re.compile(r'[^A-Z^a-z]+').split(txt)
    return [word.lower() for word in words if word != '']


if __name__ == '__main__':
    apcount = {}
    wordcounts = {}
    feedcount = 0
    feedlist = [line for line in file('feedlist.txt')]
    for feedurl in feedlist:
        try:
            title,wc = getwordcounts(feedurl)
            wordcounts[title] = wc
            for word,count in wc.items():
                apcount.setdefault(word,0)
                if count > 1:
                    apcount[word] += 1
        except:
            print 'Failed to parse feed %s' % feedurl

        feedcount += 1
        print 'finish %d/%d' % (feedcount, len(feedlist))

    wordlist = []
    for w,bc in apcount.items():
        frac = float(bc)/len(feedlist)
        if frac > 0.1 and frac < 0.5: wordlist.append(w)

    out = file('blogdata.js', 'w')
    
    # Column
    out.write("var column_name = [\"%s\"" % wordlist[0])
    for word in wordlist[1:]: out.write(',\"%s\"' % word)
    out.write("];")
    out.write('\n')
    # 
    out.write("var blog_data = {")
    for blog,wc in wordcounts.items():
        out.write('"')
        out.write(blog)
        out.write("\":[%s" % (wc[wordlist[0]] if wordlist[0] in wc else "0"))
        for word in wordlist[1:]:
            if word in wc: out.write(',%s' % wc[word])
            else: out.write(',0')
        out.write('],\n')
    out.write('}\n')
