if [[ $(env | grep ChocolateyInstall | wc -l) -gt 0 ]]; then
  echo "windows"
  exit 0
fi

if [[ $(env | grep HOMEBREW | wc -l) -gt 0 ]]; then
  echo "mac"
  exit 0
fi

echo "linux"
