cd 'C:\Users\jef\Documents\Paradox Interactive\Hearts of Iron IV\mod\enclaverb\gfx'
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

"added events:"
Foreach ($name in $names)

{
   "# GFX_$name"
};