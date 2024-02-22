
#!/bin/sh

print_list() {
  echo "1) Search Address Book"
  echo "2) Add an Address Book entry"
  echo "3) Edit the existing Address Book entry"
  echo "4) Remove an Address Book entry"
  echo "5) For quit the app, press 4 "
}

read_record() {

  RECORD=$1
  ID=$(nl address.txt | grep -w $RECORD | awk '{print $2}')
  NAME=$(nl address.txt | grep -w $RECORD | awk '{print $3}')
  PHONE=$(nl address.txt | grep -w $RECORD | awk '{print $4}')

  echo "Id: $ID , Name: $NAME , Phone: $PHONE"
}

insert_record() {
  echo "please enter id"
  read ID
  echo "please enter name "
  read NAME
  echo "please enter phone number "
  read PHONE 
  echo "Adding address book entry..."
  echo "$ID:$NAME:$PHONE" >> address.txt
  echo "data inserted!"
}

remove_record() {
  DATA=$1
  echo "Removing address book entry"
  sed -i "/$DATA/d" address.txt
}
modify_record(){
#pending
}

go_back() {
  echo "for going back to main menu press m, for quit press q"

  read CHOICE_MENU
  if [ $CHOICE_MENU = "m" ]; then
    print_list
    read CHOICE
    elif [ $CHOICE_MENU = "q" ]; then
      exit 0
    else 
      echo "the command you typed is not correct, for main menu presss m, for quit type q"
  fi
}

echo "---Addressbook---"

print_list

read CHOICE

while [ $CHOICE -ne 5 ]
do
  if [ $CHOICE -eq 1 ]; then
    echo "please enter either id,name or phone number"
    read QUERY
    read_record $QUERY
    go_back
    elif [ $CHOICE -eq 2 ]; then
      insert_record
      go_back
       elif [ $CHOICE -eq 3 ]; then
      echo "please enter either id,name or phone number of user that you want to modify"
      read USER
      modify_record $USER
      go_back
    elif [ $CHOICE -eq 4 ]; then
      echo "please enter either id,name or phone number of user that you want to remove"
      read USER
      remove_record $USER
      go_back
    else 
      exit 0
  fi
done