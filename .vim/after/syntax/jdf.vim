syntax match   jdfStep    /^@JOB,[^,]*/
syntax match   jdfComment /^#.*/
syntax match   jdfEruby   /^%.*/

"highlight link jdfCom     String
highlight link jdfStep    Underlined
highlight link jdfComment String
highlight link jdfEruby   NonText
