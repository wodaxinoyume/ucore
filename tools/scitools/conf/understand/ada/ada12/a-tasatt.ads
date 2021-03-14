------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                  A D A . T A S K _ A T T R I B U T E S                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 1992-2009, Free Software Foundation, Inc.         --
--                                                                          --
-- This specification is derived from the Ada Reference Manual for use with --
-- GNAT. The copyright notice above, and the license provisions that follow --
-- apply solely to the  contents of the part following the private keyword. --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Task_Identification;

generic
   type Attribute is private;
   Initial_Value : Attribute;

package Ada.Task_Attributes is

   type Attribute_Handle is access all Attribute;

   function Value
     (T    : Ada.Task_Identification.Task_Id :=
               Ada.Task_Identification.Current_Task) return Attribute;

   function Reference
     (T    : Ada.Task_Identification.Task_Id :=
               Ada.Task_Identification.Current_Task) return Attribute_Handle;

   procedure Set_Value
     (Val : Attribute;
      T   : Ada.Task_Identification.Task_Id :=
              Ada.Task_Identification.Current_Task);

   procedure Reinitialize
     (T :   Ada.Task_Identification.Task_Id :=
              Ada.Task_Identification.Current_Task);

private
   pragma Inline (Value);
   pragma Inline (Set_Value);
   pragma Inline (Reinitialize);

end Ada.Task_Attributes;
