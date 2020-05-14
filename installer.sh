clear
printf "\nstarting installer ⏳..."
sleep 1



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

brew_installs=( "git" "python3")

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

python_installs=( "pip3")

for app in ${brew_installs[@]}; do
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



# printf "\nchecking for pip3..."
# if [ -x "$(command -v pip3)" ]; then
#   printf "\npip3 already installed ✓\n"
#   pip3 --version
# else
#   printf "\npip3 not installed"
#   printf "\ninstalling pip3..."
#   python3 get-pip.py
#   printf "\npip3 installed ✓"
# fi



# printf "\nchecking for geopandas..."
# if [ -x "$(command -v geopandas)" ]; then
#   printf "\ngeopandas already installed ✓\n"
# else
#   printf "\ngeopandas not installed"
#   printf "\ninstalling geopandas..."
#   pip3 install geopandas
#   printf "\ngeopandas installed ✓"
# fi



# printf "\nchecking for pandas..."
# if [ -x "$(command -v pandas)" ]; then
#   printf "\npandas already installed ✓\n"
# else
#   printf "\npandas not installed"
#   printf "\ninstalling pandas..."
#   pip3 install pandas
#   printf "\npandas installed ✓"
# fi



# printf "\nchecking for folium..."
# if [ -x "$(command -v folium)" ]; then
#   printf "\nfolium already installed ✓\n"
# else
#   printf "\nfolium not installed"
#   printf "\ninstalling folium..."
#   pip3 install folium
#   printf "\nfolium installed ✓"
# fi



# printf "\nchecking for geopy..."
# if [ -x "$(command -v geopy)" ]; then
#   printf "\ngeopy already installed ✓\n"
# else
#   printf "\ngeopy not installed"
#   printf "\ninstalling geopy..."
#   pip3 install geopy
#   printf "\ngeopy installed ✓"
# fi



printf "\ninstaller complete 👍"
printf "\nquitting installer...\n\n"
sleep 1