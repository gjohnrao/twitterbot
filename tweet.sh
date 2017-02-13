#!/bin/bash

NUM=1
while true
do
PICTURE=$(head -$NUM imglistUniq |tail -1)
if grep -Fxq "$PICTURE" sentphotos
then
NUM=$((NUM+1))
else
SUBJECT=$(shuf -n 1 subjectlines)
echo $SUBJECT

python - <<@@
#!/usr/bin/env python

import twitter

api = twitter.Api(consumer_key="GOPdrExI1lzhQcXMcMqmqVpRq",
                  consumer_secret="f33XEZL3SMmMuMvfnHUr1Pkf6qp7yUtWM30OeevQzC9odvOLGc",
                  access_token_key="775375340214493184-OoYDnUS4e4gp3HsPEBMWf8j6RXME0NR",
                  access_token_secret="2tB3d6UdaayG6whzDhXpmnw0h6EhZwHhUuJEx6uefFUvS")

status = api.PostUpdate(media="$PICTURE", status="$SUBJECT")
print status

@@

echo "$PICTURE" >>sentphotos
    break

fi

done
