# discogs-loader
If you want to access the discogs-api, you do not need Python, C or other languages. Here you can find some bash-scripts which I made to down-, upload some data only in bash.

All you need is *curl* normally it is installed on your system and *jq* if you use a ubuntu-like system you can install it with:
```
sudo apt-get install jq
```

### jq
... is a lightweight and flexible command-line JSON processor. All the data you get by the discogs-api is formated in JSON. 
After installing you can make a test-request with:
```
curl https://api.discogs.com/releases/12345 --user-agent "FooBarApp/3.0" | jq '.'
```
Now you can see the formated output of this JSON-data in your terminal window.
```
curl https://api.discogs.com/releases/123 --user-agent "FooBarApp/3.0" | jq -r '.tracklist[].title'
```
You can get some data-fields from JSON-Object. In this case all the tracks from the release 123.

Pasring the JSON-data is, how you can see, verry simple. Have a look to the bash-scripts here.

### discogs-token
If you are a registered discogs-user, you can create a token to get more information. For example you will get with *discogs_getreldata* all the picture-url's too. 

To create your token, go to the discogs-homepage and log in. Navigate to settings... devellopers... generate token... thats it. Vistit *https://www.discogs.com/developers/* for further description of the discogs-api and *https://stedolan.github.io/jq/* to learn about the usage of jq.

If you have your token and username create path/file in your home-folder:
```
$HOME/.config/discogs-loader/discogs.conf"
```
In this textfile insert your name, token in this form:
```
USER discogsmember007
TOKEN AbCdEfGhIjKlMnOpQrStUvWxYz
```


# discogs_getreldata <- a little helper
Loads all the data from a release and prints to stdout.
- usage: discogs_getreldata release-no


# discogs_flactagger
You can tag your flac files in terminal and download an image from discogs.
- usage: navigate to a folder with flac files and start *discogs_flactagger*
If you want to use this, please install (if not):
```
sudo apt-get install imagemagick flac 
```
Flac files in folder must be named cronological: "01.flac" "02.flac" "03.flac" or something like this. You must know your release number from discogs.

I have several versions from one release such as "Metallica - Kill 'em all" from vinyl, cd, cd repress from 2017. So my method to tag flac files is:
```
ARTIST      Metallica
ALBUM       Kill 'Em All [2003 Vinyl Album]
DATE        1983
GENRE       Thrash
GENRE       Speed Metal
TITLE       Hit The Lights
TRACKNUMBER 1
```
2003 in ALBUM means the release year from THIS release, 1983 in DATE means 1983 was the master release year... first time. In Album I have two other fields in [] Vinyl and Album, where this can be: Vinyl, CD, MC, Misc ; Album, Single, EP, Compilation, Misc.

With this method I can order my music database in kodi by year and have an ordered discography but can chose one of my different versions.

![alt text](https://github.com/thgoso/discogs-loader/blob/master/Image.jpg)


# discogs_exportcollection
Just start it without any parameters and you can download your own collection data, custom-fields, folder-infos, user-infos or any other user-collection, wantlist if it is public. Data will be exported in json-formated text and stored in a tar.gz file in your home folder.


# discogs_importcollection
If you have downloaded your or any other collection with discogs_exportcollection, now you need this script to upload local data to your discogs-account. You can upload:
- local wantlist to discogs wantlist
- local wantlist to any discogs collection folder
- local collection folder to any collection folder on discogs
- local collection folder to discogs wantlist
- the content of any local textfield to any discogs textfield
- the content of any local dropdown item to any discogs dropdown item

Let's have a look at the console output, so you can understand what is possible:
```
------------------------ DISCOGS IMPORT ------------------------
Enter user-name and user-token from discogs-account for upload.
Enter full path/filename of your local discogs-export-file.
user-name: XXXXXXXXX
user-token: XXXXXXXXXXXXXXX
input-file full path/name: ./thomas
Read input file...
Connecting to discogs...
Read folders...
Folders/Wantlist in local data: ID name items                   
0          All                                               764
1341620    CDs                                               232
1341654    Kassetten                                           6
1339172    Vinyl G-F                                         242
1340405    Vinyl M-VG                                        284
w          Wantlist                                            1
Folders/Wantlist in discogs: ID name items                      
1341620    CDs                                               232
1341654    Kassetten                                           6
1343369    newfolder                                           0
1          Uncategorized                                       0
1339172    Vinyl G-F                                         242
1340405    Vinyl M-VG                                        284
w          Wantlist                                            1
----------------------------------------------------------------
Type ID-local-folder <SPACE> ID-discogs-folder
For example: <0 1> and press <ENTER>
To upload local data from folder with id 0
To discogs folder with ID 1
When routing done, press <ENTER> on blank line.
SRC-ID DEST-ID: 1339172 1
SRC-ID DEST-ID: 
Read textfields...
Textfields in local data: ID name lines                         
2          Kauf am:                                            1
3          Kauf bei:                                           1
4          Kaufpreis:                                          1
Textfields in discogs: ID name lines                            
2          Kauf am:                                            1
3          Kauf bei:                                           1
4          Kaufpreis:                                          1
----------------------------------------------------------------
Type ID-local-textfield <SPACE> ID-discogs-textfield
For example: <1 2> and press <ENTER>
To upload local data from textfield with id 1
To discogs textfield with ID 2
When routing done, press <ENTER> on blank line.
SRC-ID DEST-ID: 2 3
SRC-ID DEST-ID: 3 4
SRC-ID DEST-ID: 4 2
SRC-ID DEST-ID: 
Read dropdownfields...
Dropdownfields in local data: ID name items                     
5          Kauf Zustand:                                       2
1          FlacRec:                                            1
Dropdownfields in discogs: ID name items                        
5          Kauf Zustand:                                       2
1          FlacRec:                                            1
----------------------------------------------------------------
Type ID-local-dropdownfield <SPACE> ID-discogs-dropdownfield
For example: <1 2> and press <ENTER>
To upload local data from dropdownfield with id 1
To discogs dropdownfield with ID 2
When routing done, press <ENTER> on blank line.
SRC-ID DEST-ID: 1 1
SRC-ID DEST-ID: 5 5
SRC-ID DEST-ID: 
----------------------------------------------------------------
Now please route your field-items for every dropdown-menu.
Type <1 3> <ENTER> to set dropdown-text to text with number 3 on
Discogs, when dropdown-text in local data whith number 1 is set
When routing done, press <ENTER> on blank line.
ID  Text local dropdown         ID  Text discogs dropdown       
1   "Yes"                       1   "Yes"                      
SRC-ID DEST-ID: 1 1
SRC-ID DEST-ID: 
ID  Text local dropdown         ID  Text discogs dropdown       
1   "Neu"                       1   "Neu"                      
2   "Gebraucht"                 2   "Gebraucht"                
SRC-ID DEST-ID: 1 2
SRC-ID DEST-ID: 2 1
SRC-ID DEST-ID: 
----------------------------------------------------------------
Now let's start upload
If you are logged in discogs via browser LOG OUT now !!!
Do NOT change any data on your account while uploading !!!
Do NOT use discogs-homepage or server in any other form !!!
Accessing discogs is rate-limited. If you use discogs while
uploading data, upload-rate will go down.
Press <ENTER> when ready !
.
.
.
Done

```

### Slow down-, upload
Data transfer will be limited by discogs, so the down-, upload need some time if the collection is large.
