------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                       S Y S T E M . P A C K _ 5 4                        --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 1992-2005, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNAT;  see file COPYING.  If not, write --
-- to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, --
-- Boston, MA 02110-1301, USA.                                              --
--                                                                          --
--
--
--
--
--
--
--
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Handling of packed arrays with Component_Size = 54

package System.Pack_54 is
   pragma Preelaborate;

   Bits : constant := 54;

   type Bits_54 is mod 2 ** Bits;
   for Bits_54'Size use Bits;

   function Get_54 (Arr : System.Address; N : Natural) return Bits_54;
   --  Arr is the address of the packed array, N is the zero-based
   --  subscript. This element is extracted and returned.

   procedure Set_54 (Arr : System.Address; N : Natural; E : Bits_54);
   --  Arr is the address of the packed array, N is the zero-based
   --  subscript. This element is set to the given value.

   function GetU_54 (Arr : System.Address; N : Natural) return Bits_54;
   --  Arr is the address of the packed array, N is the zero-based
   --  subscript. This element is extracted and returned. This version
   --  is used when Arr may represent an unaligned address.

   procedure SetU_54 (Arr : System.Address; N : Natural; E : Bits_54);
   --  Arr is the address of the packed array, N is the zero-based
   --  subscript. This element is set to the given value. This version
   --  is used when Arr may represent an unaligned address

end System.Pack_54;
