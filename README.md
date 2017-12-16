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
If you are a registered discogs-user, you can create a token to get more information. For example you will get with *discogs_getreldata* all the picture-url's too. If you use your user-name and your user-token with *discogs_getuserdata* you can see all you private folders, custom-fields and so on.

To create your token, go to the discogs-homepage and log in. Navigate to settings... devellopers... generate token... thats it. Vistit *https://www.discogs.com/developers/* for further description of the discogs-api and *https://stedolan.github.io/jq/* to learn about the usage of jq.


# little helpers
## discogs_getreldata
Loads all the data from a release and prints data out to stdout.
- usage: discogs_getreldata release-no [OPTIONAL your discogs-token]

## discogs_getuserdata
Loads all the data from a user and prints data out to stdout.
- usage: discogs_getuserdata user-name [OPTIONAL user-token]

## discogs_addrelease
Adding a release to your discogs-collection.
- usage: discogs_addrelease user-token user-name folder-number release-number

you can use "1" for folder-number if you want to add in folder "uncategorized" or any other existing folder-number from your collection

## discogs_writecustom
Write custom-field in your collection.
- usage: discogs_writecustom user-token user-name folder-number release-number instance-number field-id json-string

json-string must be formated in the right way like '"text"' (including doubble-quotes)


# collection export / import
## discogs_exportcollection
Just start it without any parameters and you can download your own collection data, custom-fields, folder-infos, user-infos or any other user-collection, wantlist if it is public. Data will be exported in json-formated text and stored in a tar.gz file in your home folder.

## discogs_importcollection
Work in progress... Upload your exported data on another discogs-account

### Slow down-, upload
Data transfer will be limited by discogs, so the down-, upload need some time if the collection is large.
