#!/usr/bin/env python
import subprocess
from sys import stdin
from sys import argv
from DD import *

class BashDD(DD):        
  def filtered_input(self, c):
    sublines = ""
    for i in c:
       sublines = sublines + self.lines[i]
    return sublines
  
  # needs to FAIL when all deltas are applied and
  # needs to PASS when no deltas are applied.
  def _test(self, c):
    "Test the configuration C.  Return PASS, FAIL, or UNRESOLVED."
    
    
    p = subprocess.Popen(self.cmd, stdin=subprocess.PIPE)
    p.communicate(self.filtered_input(c))
    if p.wait() == 0:
       return self.FAIL
    else:
       return self.PASS

  def __init__(self, cmd, lines):
    self.cmd = cmd
    self.lines = lines
    DD.__init__(self)

if __name__ == '__main__':
  cmd = argv[1:]
  if cmd and cmd != ["-h"] and cmd != ["--help"]:
    lines = []
    lineno = 0
    all_lines = []
    for line in stdin:
      all_lines.append(lineno)
      lines.append(line)
      lineno = lineno + 1
    
    bashdd = BashDD(cmd, lines)
    
    if argv[1] == '--monotone':
      cmd = argv[2:]
      bashdd = BashDD(cmd, lines)
      bashdd.monotony = 1
    else:
      bashdd.monotony = 0
    
    c = bashdd.ddmin(all_lines)  # Invoke DDMIN
    print "Removing any line from the following will make the command fail."
    print "==="
    print bashdd.filtered_input(c).rstrip()
  else:
    print "usage:"
    print "  cat input | %s [--monotone] cmd args..." % argv[0]
    print
    print "Strip lines from input as long as cmd keeps returning SUCCESS."
    print
    print
    print "options:"
    print "  --monotone  Assume that extra lines can't hurt."
    print "              Not true if the input needs to balance braces, for example."
    print
    print 'examples:'
    print '  Find the smallest program acceptable by gcc.'
    print '    $ cat hello.c'
    print '    #include <stdio.h>'
    print '    '
    print '    int main() {'
    print '      printf("hello world\\n");'
    print '      return 0;'
    print '    }'
    print '    $ cat hello.c | %s gcc -x c -'
    print '    [...]'
    print '    dd: done'
    print '    Removing any line from the following will make the command fail.'
    print '    ==='
    print '    int main() {'
    print '    }'
