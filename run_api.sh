Rscript plumb.R & export APP_PID=$!

inotifywait -m . ./api -e close_write -e create -e moved_to | while read -r path action file;

do
    kill $APP_PID
    echo "File changed '$file'\n"
    # echo "The file '$file' appeared in directory '$path' via '$action'"
    Rscript plumb.R & export APP_PID=$!
done

