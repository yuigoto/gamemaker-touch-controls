# GameMaker Touch Controls

> Hi! These are some touch control widgets I made while I was porting my previous LD entry, **[Rainwater (is Free)](http://ludumdare.com/compo/ludum-dare-37/?action=preview&uid=50909)** for Android.

You'll need to have **GameMaker: Studio** (v1.4x) or **GameMaker Studio 2**.

There are only two objects in this project and, to check their status, all you have to do is watch for updates on them. You can have two analog buttons on screen just fine too! :smile:

----------------------------------------------------------------------

## Dependencies

As I said above, you'll need **GameMaker: Studio** or **GameMaker Studio 2** to run this project.

----------------------------------------------------------------------

## How To

Place any of the objects in the room and cook your own way to watch for their properties, then you're good to go! :+1:

You need to have a pointer, global variable or something, so you can track the values on each object. :video_game:

On the examples I placed inside the test room, specially the buttons, check for each of their creation codes, since I set their values there.

Also, no guarantees on performance or anything else. This project comes with no batteries included and assumes you know a bit of GML already. :wink:

### Tracking the Values

- On **Analog Sticks**, these values are available for you to track:
	- `hold` (boolean): if the stick is being held down
	- `press` (boolean): if the stick was just pressed
	- `release` (boolean): if the stick was just released
	- `h_pos` (float): the value of the stick's X axis, ranges from -1 ~ 1
	- `v_pos` (float): the value of the stick's Y axis, ranges from -1 ~ 1
- On **Buttons**, these are the available values:
	- `hold` (boolean): if the button is being held down
	- `press` (boolean): if the button was just presse
	- `release` (boolean): if the button was just released

There are more values you can set and check, so look into the source code for more.

----------------------------------------------------------------------

## Authors

See `AUTHORS.md` for more information.

----------------------------------------------------------------------

## License

This project is licensed under the `MIT License`. See `LICENSE.md` for more details on the subjects of the license.

----------------------------------------------------------------------

_©2017-2020 Fabio Y. Goto_