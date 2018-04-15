cd 'C:\Users\jef\Documents\Paradox Interactive\Hearts of Iron IV\mod\enclaverb\gfx\interface'
$names = ls -name -Path goals;
$ideas = ls -name -Path ideas;

$names = $names.replace(".dds","")
$ideas = $ideas.replace(".dds","")

$resultIdeas = Foreach ($idea in $ideas)

{
    "
        SpriteType = {#" + $idea + "
            name = `"GFX_idea_" + $idea + "`"
 		    texturefile = `"gfx/interface/ideas/"+$idea+".dds`"
 	    }"
};

$resultBody = Foreach ($name in $names)

{
    "
        SpriteType = {#" + $name + "
            name = `"GFX_goal_" + $name + "`"
 		    texturefile = `"gfx/interface/goals/"+$name+".dds`"
 	    }"
};

"spriteTypes = {" + $resultBody + $resultIdeas +  "    
}" | Out-File -FilePath ..\..\interface/customicons.gfx -Encoding utf8

$resultBody2 = Foreach ($name in $names)

{
    "
    spriteType = {#" + $name + "
		name = `"GFX_goal_"+ $name +"_shine`"
		texturefile = `"gfx/interface/goals/"+ $name +".dds`"
		effectFile = `"gfx/FX/buttonstate.lua`"
		animation = {
			animationmaskfile = `"gfx/interface/goals/"+ $name +".dds`"
			animationtexturefile = `"gfx/interface/goals/shine_overlay.dds`" 	# <- the animated file
			animationrotation = -90.0		# -90 clockwise 90 counterclockwise(by default)
			animationlooping = no			# yes or no ;)
			animationtime = 0.75				# in seconds
			animationdelay = 0			# in seconds
			animationblendmode = `"add`"       #add, multiply, overlay
			animationtype = `"scrolling`"      #scrolling, rotating, pulsing
			animationrotationoffset = { x = 0.0 y = 0.0 }
			animationtexturescale = { x = 1.0 y = 1.0 }
		}
		animation = {
			animationmaskfile = `"gfx/interface/goals/"+ $name +".dds`"
			animationtexturefile = `"gfx/interface/goals/shine_overlay.dds`" 	# <- the animated file
			animationrotation = 90.0		# -90 clockwise 90 counterclockwise(by default)
			animationlooping = no			# yes or no ;)
			animationtime = 0.75				# in seconds
			animationdelay = 0			# in seconds
			animationblendmode = `"add`"       #add, multiply, overlay
			animationtype = `"scrolling`"      #scrolling, rotating, pulsing
			animationrotationoffset = { x = 0.0 y = 0.0 }
				animationtexturescale = { x = 1.0 y = 1.0 }
		}
		legacy_lazy_load = no
	}"
};

"spriteTypes = {" + $resultBody2 + "    
}" | Out-File -FilePath ..\..\interface/customicons_shine.gfx -Encoding utf8

"added names:"
Foreach ($name in $names)

{
   "# GFX_goal_$name"
};

"added ideas:"
Foreach ($idea in $ideas)

{
   "# GFX_idea_$idea"
};