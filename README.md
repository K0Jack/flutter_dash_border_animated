## flutter_dash_border_animated

### Normal use
<img src="https://github.com/K0Jack/flutter_dash_border_animated/blob/main/image_dash_border_animated.gif", with=400>

### Example
```dart
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.red,
                child: Center(
                    child: Text(
                  'Just Run Rec',
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.blue,
                child: Center(
                    child: Text(
                  'Just Run Square',
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.yellow,
                dashRunType: DashBorderRunType.rectanglePip,
                child: Center(
                  child: Text(
                    'Rounded Run',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: DashBorderAnimated(
                dashColor: Colors.green,
                dashRunType: DashBorderRunType.circle,
                child: Center(child: Text('Circle')),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
```

#Note: Remember you need to wrap DashBorderAnimated inside the widget father that's get it's size