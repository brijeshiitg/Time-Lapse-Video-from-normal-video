input_path='./Trip_videos/'
output_path='./time_lapse/'
if [ ! -d $output_path ]; then
	echo "directory does not exist!. Creating ..."
	mkdir $output_path
fi
echo "directory exists! Skipping .."

for f in $input_path*.mp4
do
	echo "processing file "$(basename $f)

	ffmpeg -i $input_path$(basename $f) -r 60 -filter:v "setpts=0.0625*PTS" -vcodec libx264 -an $output_path$(basename $f)
	#ffmpeg -i $input_path$(basename $f) -r 30 -filter:v "setpts=0.06667*PTS" -vcodec libx264 -an $output_path$(basename $f)
done

