#!/bin/bash

function fetchGP {
  echo ""
	echo "Fetching from https://github.com/gooderprojects/gooderprojects.github.io..."
	cd ~/gooderprojects.github.io
	git fetch origin && echo "Pulling from https://github.com/gooderprojects/gooderprojects.github.io..." && git pull origin
	cd ~/
}

function fetchIX {
  echo ""
	echo "Fetching from https://github.com/Zbomb2000/IXHell..."
	cd ~/IXHell
	git fetch origin && echo "Pulling from https://github.com/Zbomb2000/IXHell..." && git pull origin
	cd ~/
}

function fetchTD {
  echo ""
	echo "Fetching from https://github.com/Zbomb2000/the-dumpster..."
	cd ~/the-dumpster
	git fetch origin && echo "Pulling from https://github.com/Zbomb2000/the-dumpster..." && git pull origin
	cd ~/
}

function fetchCB {
  echo ""
	echo "Fetching from https://github.com/Zbomb2000/chromebook-backups..."
	cd ~/chromebook-backups
	git fetch origin && echo "Pulling from https://github.com/Zbomb2000/chromebook-backups..." && git pull origin
	cd ~/
}

function fetchRepos {
  if [ "$1" == "gooderprojects.github.io" ] ; then
    fetchGP
  elif [ "$1" == "IXHell" ] ; then
    fetchIX
  elif [ "$1" == "the-dumpster" ] ; then
    fetchTD
  elif [ "$1" == "chromebook-backups" ] ; then
    fetchCB
  else
    echo ""
    echo "Exiting..."
    exit
  fi
}

echo "Select (in the popup window) what repos you want to fetch and pull."
REPO_SELECT=$(zenity --list --checklist --title="What repo would you like to fetch/pull?" --column="" --column="Repo" --column="path" \
"" "gooderprojects.github.io" "~/gooderprojects.github.io" \
"" "IXHell" "~/IXHell" \
"" "the-dumpster" "~/the-dumpster" \
"" "chromebook-backups" "~/chromebook-backups")


OCCURENCES="${REPO_SELECT//[^'|']}"

if [ "${#OCCURENCES}" == 0 ] ; then
  IFS="|" read VAR <<< "$REPO_SELECT"
  fetchRepos $VAR
  echo ""
  echo "Done!"
fi

if [ "${#OCCURENCES}" == 1 ] ; then
  IFS="|" read VAR VARR <<< "$REPO_SELECT"
  fetchRepos $VAR
  fetchRepos $VARR
  echo ""
  echo "Done!"
fi

if [ "${#OCCURENCES}" == 2 ] ; then
  IFS="|" read VAR VARR VARRR <<< "$REPO_SELECT"
  fetchRepos $VAR
  fetchRepos $VARR
  fetchRepos $VARRR
  echo ""
  echo "Done!"
fi

if [ "${#OCCURENCES}" == 3 ] ; then
  IFS="|" read VAR VARR VARRR VARRRR <<< "$REPO_SELECT"
  fetchRepos $VAR
  fetchRepos $VARR
  fetchRepos $VARRR
  fetchRepos $VARRRR
  echo ""
  echo "Done!"
fi

sleep 0.5
echo "Exiting..."
exit
