#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2019 Ward
#
#====================================================================

import macros

macro winapi*(x: untyped): untyped =
  when not defined(noDiscardableApi):
    x.addPragma(newIdentNode("discardable"))

  result = x

proc discardable*[T](x: T): T {.discardable, inline.} = x

const
  winimAnsi* = defined(useWinAnsi) or defined(winansi)
  winimUnicode* = not winimAnsi
  winimCpu64* = defined(cpu64)
  winimCpu32* = not defined(cpu64)
