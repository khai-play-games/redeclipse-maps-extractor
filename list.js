#! /usr/bin/env node
'use strict'
const {extname} = require('path')
const {readdirSync} = require('fs')
const {log} = global.console
const accept = new Set(
  ['zip', '7z']
    .map(x => '.' + x)
)
readdirSync(__dirname)
  .forEach(
  	item =>
      accept.has(extname(item)) && log(item)
  )
