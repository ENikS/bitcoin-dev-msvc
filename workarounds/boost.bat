echo boost fixes: %1 %2


if not exist "%1/boost/signals2" (xcopy /S %2\libs\signals2\include\boost\*.* %2\boost & echo Fixing boost/signals2 includes)
if not exist "%1/boost/function_output_iterator.hpp" (xcopy /S %2\libs\iterator\include\boost\*.* %2\boost & echo Fixing boost/iterator includes)
if not exist "%1/boost/asio.hpp" (xcopy /S %2\libs\asio\include\boost\*.* %2\boost & echo Fixing boost/asio includes)
if not exist "%1/boost/filesystem.hpp" (xcopy /S %2\libs\filesystem\include\boost\*.* %2\boost & echo Fixing boost/filesystem.hpp includes)
if not exist "%1/boost/assign/list_of.hpp" (xcopy /S %2\libs\assign\include\boost\*.* %2\boost & echo Fixing boost/assign includes)
rem if not exist "%1/boost/" (xcopy /S %2\libs\.\include\boost\*.* %2\boost & echo Fixing boost/. includes)
