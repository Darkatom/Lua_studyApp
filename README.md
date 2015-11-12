Lua_studyApp
------------
Really simple console application for those trying to study a list of things and can not get to memorize them.

How to install it
------------
No install needed. 
For now, this program is only available for Windows. Each folder has an .exe. Download the folder and execute it.
If you are using something else, you will have to compile the program for your OS. No need to worry; all source files are provided.

How to use it
------------
First, you need a data.txt. This text file will contain whatever you want to memorize.
For now, as of v.1.0., the program only reads one data.txt, so be sure to change the name of the file if you want to load other data.

The syntax of the .txt would be as follows:
- Each item is separated by ;, no spaces before or after.
- If an item has several subitems, they will be separated by commas (,), no spaces before of after.

Let's say we want to memorize cars. 
First line contains the categories:><br/>
<code>NAME;BRAND;DOORS;AVAILABLE COLOURS;</code>

After that, we would have our cars. For example:<br/>
<code>560SL;Mercedes Benz;4;Black,Red,White</code><br/>
<code>Beetle;Volkswagen;4;Yellow</code>

Etc.

Then, you start the app (yey!). You will be presented with two options: 1. See Stored Data (useful to check if data.txt is correct) and 2. Study!

Study! will lead you to choosing a field that will act as a tip and the one you want to memorize. 
NOTE: Don't choose something that is not unique, e.g. Brand, as there may be several Volkswagen cars stored in your data.txt, and you won't know which is which.

studyApp will then proceed to choose random lines of the data and ask you to state correctly the value of the field you chosed to study. If the value is composed of several subitems, you will have to provide them in order.

Remember: studyApp is not case sensitive, but will ask for exact notation.
Also remember: You can always exit or go back using 0.

Let the Study Games begin and may the exams be ever in your favour!


