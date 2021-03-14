------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--          A D A . S E Q U E N T I A L _ I O . C _ S T R E A M S           --
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

--  This package provides an interface between Ada.Sequential_IO and the
--  C streams. This allows sharing of a stream between Ada and C or C++,
--  as well as allowing the Ada program to operate directly on the stream.

with Interfaces.C_Streams;

generic
package Ada.Sequential_IO.C_Streams is

   package ICS renames Interfaces.C_Streams;

   function C_Stream (F : File_Type) return ICS.FILEs;
   --  Obtain stream from existing open file

   procedure Open
     (File     : in out File_Type;
      Mode     : File_Mode;
      C_Stream : ICS.FILEs;
      Form     : String := "";
      Name     : String := "");
   --  Create new file from existing stream

end Ada.Sequential_IO.C_Streams;
