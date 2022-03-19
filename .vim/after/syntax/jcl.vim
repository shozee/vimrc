syntax keyword jclStep    step
syntax keyword jclCom     pgm sys jpp dd
syntax match   jclDdin    / in /
syntax match   jclDdout   / out /
syntax match   jclComment /^#.*/
syntax match   jclEruby   /^%.*/

highlight link jclStep    Underlined
highlight link jclCom     Identifier
highlight link jclDdin    String
highlight link jclDdout   SpecialChar
highlight link jclComment Comment
highlight link jclEruby   NonText
