clear
printf "\nstarting installer ⏳...\n"
sleep 1

brew_installs=( "git" "python3")
pip3_installs=( "geopandas" "pandas" "folium" "geopy")
python_installs=( "pip3")

# brew installation
printf "\nchecking for brew..."
if [ -x "$(command -v brew)" ]; then
  printf "\nbrew already installed ✓\n"
  brew -v
else
  printf "\nbrew not installed"
  printf "\ninstalling brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  printf "\nbrew installed ✓"
fi

# brew installations loop
for app in ${brew_installs[@]}; do
  printf "\nchecking for $app..."
  if [ -x "$(command -v $app)" ]; then
    printf "\n$app already installed ✓\n"
  else
    printf "\n$app not installed"
    printf "\ninstalling $app..."
    brew install $app
    printf "\n$app installed ✓"
  fi
done

# python installations loop
for app in ${python_installs[@]}; do
  printf "\nchecking for $app..."
  if [ -x "$(command -v $app)" ]; then
    printf "\n$app already installed ✓\n"
  else
    printf "\n$app not installed"
    printf "\ninstalling $app..."
    python3 install $app
    printf "\n$app installed ✓"
  fi
done

# pip installations loop
for app in ${pip3_installs[@]}; do
  printf "\nchecking for $app...\n"
  pip3 install $app
  printf "$app installed ✓\n"
done

printf "\ninstaller complete 👍"
printf "\nexiting installer...\n\n"
sleep 1