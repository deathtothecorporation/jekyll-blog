port=59357
base_url="http://localhost:$port"
UI_DIR="_site"
ACCESS_KEY="v@p0rvv@r3"

echo "Setting interface files from $UI_DIR..."
echo "To $base_url"

find "$UI_DIR" -type f | while IFS= read -r file; do

  file_relative_path="${file#$UI_DIR}"
  url="$base_url$file_relative_path"

  # Determine content type
  content_type=""
  case "$file" in
    *.html) content_type="text/html" ;;
    *.js) content_type="text/javascript" ;;
    *.css) content_type="text/css" ;;
    *.json) content_type="application/json" ;;
    *.png) content_type="image/png" ;;
    *.jpg|*.jpeg) content_type="image/jpeg" ;;
    *.mp4) content_type="video/mp4" ;;
    *.webm) content_type="video/webm" ;;
    *.svg) content_type="image/svg+xml" ;;
    *.otf) content_type="font/otf" ;;
    *.woff) content_type="font/woff" ;;
    *.woff2) content_type="font/woff2" ;;
    *.ttf) content_type="font/ttf" ;;
    # add other file types as needed
  esac

  # Upload the file
  echo "Uploading $file to $url"
  curl --data-binary @"$file" -H "Content-Type: $content_type" -H "authorization: $ACCESS_KEY" -X PUT "$url"
done
