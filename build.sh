batchScriptName='.batch-port-kill.bat'
portNumber=4007
echo "The application should serve on [localhost:$portNumber](http://localhost:$portNumber/) by default."
echo "Building project..."




powershell kill-port.ps1 $portNumber
kill -kill `lsof -t -i tcp:$portNumber`
bundle install
bundle update --bundler
bundle update faraday
bundle exec jekyll serve --watch --port $portNumber

echo "The application should be served on [localhost:$portNumber](http://localhost:$portNumber/)"