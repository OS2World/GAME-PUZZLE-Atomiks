/* by Digi */

parse arg FSpec
if FSpec = "" then
do
  say "Usage: bin2h.cmd <filespec>"
  exit 0
end

dir = filespec( "path", FSpec )

call SysFileTree FSpec, "list", "FO"

do idx = 1 to list.0
  file = dir || filespec( "name", list.idx )

/*
   Utility from vim.
   "@xxd -i " || file
*/
  "@file2c.exe " || file
end
