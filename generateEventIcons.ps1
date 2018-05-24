cd 'C:\Users\jef\Documents\Paradox Interactive\Hearts of Iron IV\mod\enclaverb\gfx\interface'
$names = ls -name -Path event_pictures;

$names = $names.replace(".tga","")


$resultBody = Foreach ($name in $names)

{
    "
        SpriteType = {#" + $name + "
            name = `"GFX_" + $name + "`"
 		    texturefile = `"gfx/event_pictures/"+$name+".tga`"
 	    }"
};

"spriteTypes = {" + $resultBody + $resultIdeas +  "    
}" | Out-File -FilePath ..\..\interface/enc_eventpictures.gfx -Encoding utf8

$events_file = Foreach ($name in $names)
{
   "# GFX_$name"
};
 "events = {" + $events_file + "    
}" 
$events_file | Out-File -FilePath ..\..\events_file.txt -Encoding utf8 ;
