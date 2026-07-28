Custom MiniScript Functions Reference
========================================

s = String in the form “ObjectName”
f = Float Number in the form 0.2

Function Name: moveObject
Description: This function moves an object to a specific location.
It is in the form => moveObject sObjectName, fX, fY, fZ
Example => moveObject “Cube1”, 1, 2, 3

Function Name: rotateObject
Description: This function rotates an object to a specific rotation.
It is in the form => rotateObject sObjectName, fX, fY, fZ

Function Name: scaleObject
Description: This function scales an object to a specific scale value.
It is in the form => scaleObject sObjectName, fX, fY, fZ

Function Name: setLightObject
Description: This function works on any Light object.
It is in the form => setLightObject sLightObjectName, sHexLightColor, fLightIntensity, sShadowType, fShadowStrength
Example => setLightObject “Light1”, “#FDFDB3”, 1, hard/soft, 0.6

Function Name: openURL
Description: This function opens a URL in an external window. This is useful for various interactive functionality. NOTE: Do not use this for plotJump to jump to other galaxies. It is in the form => openURL sURLLink
Example => openURL “https://xrxplorer.com”

Function Name: playSound
Description: This function will play one of the 50 built in sounds. You can select the play type as well such as oneshot or loop. The third input type is if the sound is 2D or 3D sound where 3D sound is spatial sound.
It is in the form => playSound sSoundNumber, sSoundLoopType, sSoundDimensionType
EExample => playSound “20”, “oneshot”, “3D”

Function Name: aniObject
Description: This function will play an animation on an Object (Specifically the first animation) on a model or GLB or GLTF Custom Model you have loaded. It is in the form => aniObject sObjectName, sAnimationNameOrIndex, sPlayMode, fSpeed

Function Name: playAudio
Description: This function will play audio mp3 from a URL (Please supply mp3 from local URL via FileZilla Upload to server my-content or else you will have CORS policy issue). You can select the play type as well such as oneshot or loop. Please make sure you have all the royalty free and permission rights to play the song or music (NOTE: This is not the same as an Ambient ZONE sounds and thus will be heard in the entire plot.)
It is in the form => playAudio sObjectName, sMP3URL, sLooping, fVolume

Function Name: playAmbientAudio
Description: This function will play AMBIENT audio mp3 from a URL using 3D sound or 2D sound (Please supply mp3 from local URL via FileZilla Upload to server my-content or else you will have CORS policy issue). You can select the play type as well such as oneshot or loop. Please make sure you have all the royalty free and permission rights to play the song or music. It is in the form => playAmbientAudio sObjectName, sMP3URL, sLooping, f3DRangeNegativeOneIs2D, fVolume

Function Name: playVideo
Description: This function will play video mp4 from a URL (Please supply mp4 from local URL via FileZilla Upload to server my-content or else you will have CORS policy issue). Please note it will take some time to download the MP4. Please make sure you have all the royalty free and permission rights to play the video.
It is in the form => playVideo sObjectName, sMP4URL, sLooping, fVolume

Function Name: plotJump
Description: This function will jump to any plot within any galaxy you specify. If a plot is locked then it will return a message to the player that the plot is locked. If you do not put in a plot name, genesis will be assumed and loaded from the galaxy you indicate. You can now indicate fX, fY, fZ location to spawn player into. If no location is given (0,0,0) it will assume the base location that is set in the Backend Plot Editor. It is in the form => plotJump sGalaxyDomain, sPlotName, fPlotXLocationToLoad, fPlotYLocationToLoad, fPlotZLocationToLoad, fPlotYRotationToLoad

Function Name: customAvatarAnim
Description: This function will play a custom avatar animation from our listing of Avatar Animations (which can be found on the Chaarmi Website Documentation) when a PLAYER Avatar triggers it. The player can then unlock it via the Movement keys.
It is in the form => customAvatarAnim sAnimationNameOrID, sPlayModeLoopOrOneshot

Function Name: CURRENT LIST OF ANIMATIONS
Description: Here is the CURRENT List of Built In Animations you can choose from

ID	Description
0	Female Idle on Chair
1	Male Idle on Chair
2	Cheer Jump
3	Cheer Fist In Air
4	Clap with Arms
5	Clap Close without Arms
6	Go Down On One Knee
7	Crouch Idle
8	No Way!
9	Hello Hand Wave
10	Super Hero Pose Ground
11	Sitting On Ground
12	Sit High
13	Sit Low
14	Sit Medium
15	Swim Forwards
16	Swim Idle
17	Boxing
18	Dance Criss Cross
19	Dance Female
20	Dance Female 2
21	Dance Fun
22	Knock on Door
23	Pickup From Floor
24	Sitting Typing On Keyboard
25	Yaay! Woo hoo!
26	Handshake
27	Meditate
28	Combat Crawl
29	Fun Skipping
30	Swimming
31	Sneaky Walk
32	Female A Okay
33	Female No No No
34	Blow a Kiss
35	Heart Sign with Hands
36	Meditate With Palm Prayer
37	Swim Paddle Stroke
38	Pickup Item Waist High
39	Ring Doorbell or Switch
40	Sitting Idle with Slight Head Motion
41	Thumbs Up
42	Amazing Awesome Cheer Ya You!
43	Please Pretty Please!
44	No No, Wait!
45	Soldier Idle Holding Rifle
46	Soldier Idle On Ground Holding Rifle
47	Soldier Salute Holding Rifle
48	Yoga – Chair Pose
49	Yoga – Dancer Pose
50	Yoga – Eagle Pose
51	Yoga – Extended Hand Big Toe Pose
52	Yoga – Hand Big Toe Pose
53	Yoga – Reverse Namaste Pose
54	Yoga – Tree Pose
55	Yoga – Boat Pose
56	Yoga – Dolphin Plank Pose
57	Yoga – Half Boat Pose
58	Yoga – Downward Dog Pose
59	Yoga – Forward Fold Pose
60	Yoga – Four Limbed Staff Pose
61	Yoga – Namaste Pose
62	Yoga – Plank Pose
63	Yoga – Shoulder Stand Pose
64	Yoga – Tadasana Pose
65	Model Pose 1
66	Model Pose 2
67	Model Pose 3
68	Model Pose 4
69	Model Pose 5
70	Model Pose 6
71	Model Pose 7
72	Model Pose 8
73	Model Pose 9
74	Model Pose 10
75	Model Pose 11
76	Model Pose 12
77	Model Pose 13
78	Model Pose 14
79	Cheer You Can Do It!
80	Slow Clap
81	High Clap
82	Clap and Thumbs Up
83	Formal Bow
84	Two Hand Blow Kiss
85	Heart with Arms Side to Side
86	Heart with Arms One Side
87	I Heart You
88	Come Hold My Hand
89	Its You
90	Dance Side to Side Bob
91	Dance Side to Side Bob More Movement
92	Cool Shooter Pose
93	Heart Elaborate With Leg Up
94	Heart Spin and Give To The World
95	Heart For You With Hands
96	Heart Half Left
97	Heart Half Right
98	Blow Big Kiss To All
99	Love Bullet Pose
100	Soldier – Holding Gun
101	Soldier – Salute Legs Only
Function Name: messageBox
Description: This function will display an informational message box to the user.
It is in the form => messageBox sTitle, sMessage

Function Name: networkCommand
Description: This function will send a network command to EVERYONEs computer and to the specific object you specify. Please refer to the documentation online for more details on how to use this function.
It is in the form => networkCommand sObject, sCommand, sData

Function Name: removeCollider
Description: This function will remove all colliders including colliders in the child objects of any object you name here. It is in the form => removeCollider sObject

Function Name: renameThisObject
Description: This function will rename this object. This is specifically for GLB and files that have been imported in. It is in the form => renameThisObject sObjectName

Function Name: localJump
Description: This function will do a local plot jump to any other object you place in the scene. Make sure you name it correctly. It is in the form => localJump sObjectName

Function Name: makeNPC
Description: This function will create an NPC out of any object. It could be a virtual avatar or anything you want to place in the scene. NPCs are LOCAL to a player and are not seen rotating or interacting with others. Each user must interact with an NPC on their own. It is in the form => makeNPC sObject, fYOffset, fShowTime, sGPTRole, sMsg1, sMsg2, sMsg3, sMsg4, sMsg5, sRandomOrSequential, sSFXorNone, sGPTEnabled, sObjectWithMiniscriptToRunAfter, sTurnToPlayer

Function Name: examineObject
Description: This function will allow you to examine or inspect any object in the scene you specify. It is in the form => examineObject sObjectName, fExamineDistance, sBGHexColor, sTitle, sDescription

Function Name: examineObjectWithButton
Description: This function will allow you to examine or inspect any object in the scene you specify and add a Button that goes to a URL. It is in the form => examineObjectWithButton sObjectName, fExamineDistance, sBGHexColor, sTitle, sDescription, sButtonTitle, sButtonURL

Function Name: runObjectCode
Description: This function will allow you to run the code on any other object in the plot. It is in the form => runObjectCode sObjectName