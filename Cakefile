fs = require 'fs'
path = require 'path'
{spawn, exec} = require 'child_process'

coffee = (args) ->
    proc =         spawn '/home/hidetomo/node_modules/.bin/coffee', args
    proc.stderr.on 'data', (buffer) -> console.log buffer.toString()
    proc.on        'exit', (status) -> process.exit(1) if status != 0

task 'build', "build source files in './src'  to '.'", ->
    target = [
        'src/point2d.coffee',
        'src/main.coffee'
    ]
    coffee ['-j','tmp.js','-o','build','-c'].concat target
    exec 'sleep 1 && cat build/tmp.js | grep -v "exports\." | grep -v "require(" > build/mds.js', (err) ->
        throw err if err
