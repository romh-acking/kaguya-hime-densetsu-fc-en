::Folders
set projectFolder=%cd%
set spiroFolder=%toolsFolder%\spiro

cd "%projectFolder%"
"%SpiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /DumpScript
@pause