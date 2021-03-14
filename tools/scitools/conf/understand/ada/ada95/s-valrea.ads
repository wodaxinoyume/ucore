------------------------------------------------------------------------------
--                                                                          --
--                         GNAT COMPILER COMPONENTS                         --
--                                                                          --
--                      S Y S T E M . V A L _ R E A L                       --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--                            $Revision: 2 $                              --
--                                                                          --
--           Copyright (c) 1992,1993,1994 NYU, All Rights Reserved          --
--                                                                          --
-- The GNAT library is free software; you can redistribute it and/or modify --
-- it under terms of the GNU Library General Public License as published by --
-- the Free Software  Foundation; either version 2, or (at your option) any --
-- later version.  The GNAT library is distributed in the hope that it will --
-- be useful, but WITHOUT ANY WARRANTY;  without even  the implied warranty --
-- of MERCHANTABILITY  or  FITNESS FOR  A PARTICULAR PURPOSE.  See the  GNU --
-- Library  General  Public  License for  more  details.  You  should  have --
-- received  a copy of the GNU  Library  General Public License  along with --
-- the GNAT library;  see the file  COPYING.LIB.  If not, write to the Free --
-- Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.        --
--                                                                          --
------------------------------------------------------------------------------

package System.Val_Real is
pragma Pure (Val_Real);

   function Scan_Real
     (Str  : String;
      Ptr  : access Positive'Base;
      Max  : Positive'Base)
      return Long_Long_Float;
   --  This function scans the string starting at Str (Ptr.all) for a valid
   --  real literal according to the syntax described in (RM 3.5(43)). The
   --  substring scanned extends no further than Str (Max). There are three
   --  cases for the return:
   --
   --  If a valid real is found after scanning past any initial spaces, then
   --  Ptr.all is updated past the last character of the real (but trailing
   --  spaces are not scanned out).
   --
   --  If no valid real is found, then Ptr.all points either to an initial
   --  non-blank character, or to Max + 1 if the field is all spaces and the
   --  exception Constraint_Error is raised.
   --
   --  If a syntactically valid real is scanned, but the value is out of
   --  range, or, in the based case, the base value is out of range or there
   --  is an out of range digit, then Ptr.all points past the real literal,
   --  and Constraint_Error is raised.
   --
   --  Note: these rules correspond to the requirements for leaving the
   --  pointer positioned in Text_Io.Get
   --
   --  Note: if Str is null, i.e. if Max is less than Ptr, then this is a
   --  special case of an all-blank string, and Ptr is unchanged, and hence
   --  is greater than Max as required in this case.

   function Value_Real (Str : String) return Long_Long_Float;
   --  Used in computing X'Value (Str) where X is a floating-point type or an
   --  ordinary fixed-point type. Str is the string argument of the attribute.
   --  Constraint_Error is raised if the string is malformed, or if the value
   --  out of range of Long_Long_Float.

end System.Val_Real;