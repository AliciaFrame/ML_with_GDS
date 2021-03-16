echo "Usage: sh render.sh [publish]"
GUIDES=~/Demos/BrowserGuides

function render {
$GUIDES/run.sh adoc/ML_with_GDSL.adoc ML_with_GDSL.html +1 "$@"
$GUIDES/run.sh adoc/DataPrep_Marvel.adoc DataPrep_Marvel.html +1 "$@"
$GUIDES/run.sh adoc/ML_Marvel.adoc ML_Marvel.html +1 "$@"

}

echo "Rendering to html"
URL=localhost:8001/
render http://$URL

echo "Starting Websever at $URL Ctrl-c to stop"
echo "// Start Guide"
echo ":play http://localhost:8001/ML_with_GDSL.html"
python $GUIDES/http-server.py
