#!/bin/bash
echo "Enter planet name: "
  read PLANET
  case $PLANET in
  	Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune)
  		echo "$PLANET is a planet from the Solar System.";;
  	Pluto)
  		echo "$PLANET is a dwarf-planet";;
  	"Planet Nine") echo "$PLANET not discovered yet";;
  	*)
  		echo "$PLANET is not from the Solar System.";;
  esac