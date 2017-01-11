package;

import bytesloader.BytesLoader;

// Tests
enum Tests
{
  LoadURL1;
}

/**
 * Class used to Test / Compile haxe-bytes-loader library
 *
 * Install https://github.com/tapio/live-server and start from html5 folder
 * Simply issue "live-server" inside the html5 folder and build (release for faster build)
 * Server will reload page automatically when JS is compiled
 */
class LoadFile
{
  // List of files
  public static inline var PATH:String = "./notes/";
  public static inline var TEST1:String = PATH + "test1.note";

  // Keep current loader
  var loader:BytesLoader = null;

  // Run some tests
  public function new()
  {
    trace("Load File Launch");

    var test = LoadURL1;

    switch (test)
    {
      case LoadURL1: loadURL( TEST1 );
    }
  }

  // Simply load a URL and do nothing else
  function loadURL( url:String )
  {
    loader = BytesLoader.load(url,
    {
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("Has Data", hasData);

        if ( hasData )
        {
          trace("Data:", data.length, data);
        }

        loader = null;
      },
      progress: function(percent)
      {
        trace("Progress", percent);
      },
      error: function(error)
      {
        trace("Error", error);
      }
    });
  }

  // Entry point
  static function main()
  {
    new LoadFile();
  }
}