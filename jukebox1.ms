true, 1.0, 10%https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Baja.mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Nichts_ist_fuer_die_Ewigkeit.mp3%Böhse Onkelz - Baja,Böhse Onkelz - Nichts ist für die Ewigkeit


true, 1.0, 10%https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Zu nah an der Wahrheit.mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Onkelz 2000.mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Ihr hättet es wissen müssen + A.D.I.O.Z _ Baja (Live Lausitzring 2005).mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Finde die Wahrheit (Live in Berlin 2004).mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Erinnerung (Live 1987).mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Du kannst alles haben.mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Danket dem Herrn (Live im Waldstadion 2022).mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - Baja.mp3,https://nft.fra1.cdn.digitaloceanspaces.com/bo/mp3/Böhse Onkelz - 10 Jahre (Vaya con Tioz).mp3%Böhse Onkelz - Zu nah an der Wahrheit,Böhse Onkelz - Onkelz 2000,Böhse Onkelz - Ihr hättet es wissen müssen + A.D.I.O.Z _ Baja (Live Lausitzring 2005),Böhse Onkelz - Finde die Wahrheit (Live in Berlin 2004),Böhse Onkelz - Erinnerung (Live 1987),Böhse Onkelz - Du kannst alles haben,Böhse Onkelz - Danket dem Herrn (Live im Waldstadion 2022),Böhse Onkelz - Baja,Böhse Onkelz - 10 Jahre (Vaya con Tioz)

///
Q: How to add AudioJukebox?
A: 

Backend =>
— Go into the Backend and make sure you have an Admin Object
— Place a Jukebox in the scene anywhere you want
— In the MiniScript code section, add code as follows:
loop_true_false, fStartVolume, f3DRangeNegativeOneIs2D%ListOfMP3CommaDelimited%ListOfTrackNamesCommaDelimited

NOTE: Make sure the % signs are in the string!!

Broken down, it should look like this:

loop_true_false, 
fStartVolume,
f3DRangeNegativeOneIs2D
%
ListOfMP3CommaDelimited
%
ListOfTrackNamesCommaDelimited


Where: 
loop_true_false – should be true to repeat the entire set of audio once the final mp3 is completed.

fStartVolume – is the volume you want to start the Jukebox audio at, where 1.0 is maximum volume

f3DRangeNegatoveOneIs2D – If you put a negative number, then the sound is 2D and is heard PLOT WIDE. If you put a positive number, the sound will become 3D and will have a linear falloff of the positive amount. For example, if you have an ocean area and want to hear ocean waves at around 20 units, then you would put 20.0 for this value and as the user approaches the sound will get louder and louder starting from 20 units away.

ListOfMP3CommaDelimited – A list of mp3 audio files to play that is comma delimited

ListOfTrackNamesCommaDelimited – A list of Track names for the mp3 audio files that will show up on the Jukebox, also comma delimited

Frontend =>
— Log into the frontend plot using one of the admin names from the Admin Object
— Upon detection, you should see the screen controls showing up on ALL Jukebox Audio Objects. ONLY an admin users of the plot who have been setup in the backend can use jukebox controls to play audio via Jukebox