A simple command-line application.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

In this example, we spawn some isolates with String message. 

The entryPoint function (runSomething) prints the message first, then call an API and print the response. If you run the script, you'll see that the isolates run in parallel (the argument on all isolates will be printed first before any isolate gets the response).