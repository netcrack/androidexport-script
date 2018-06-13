androidexport-script
====================
________
Shell script to export Inkscape svg files to android's multiple densities png format.
________
###Usage: 

androidexport.sh &lt;svg file&gt; &lt;prefix&gt; &lt;mdpi width&gt; &lt;mdpi height&gt;

###Example: 

androidexport.sh info.svg ic_title 28 28

This creates the following png files

+ drawable-mdpi/ic_title_info.png
+ drawable-hdpi/ic_title_info.png
+ drawable-xhdpi/ic_title_info.png
+ drawable-xxdpi/ic_title_info.png

System should have Inkscape installed.
