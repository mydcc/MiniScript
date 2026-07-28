// Konfiguration für die Hauptleinwand "Video(1)"
main_screen_pos_x = 70.3
main_screen_pos_y = 12.92
main_screen_pos_z = -222
main_screen_scale_x = 0.01
main_screen_scale_y = 22
main_screen_scale_z = 35
scaleObject "Video(1)", main_screen_scale_x, main_screen_scale_y, main_screen_scale_z
moveObject "Video(1)", main_screen_pos_x, main_screen_pos_y, main_screen_pos_z

// Video URLs in einer Liste
video_urls = ["https://nft.fra1.cdn.digitaloceanspaces.com/bo/Vaya_Con_Tioz_2005_720.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Vaya_Con_Tioz_2005_480.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Frankfurt_2001.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Baja2005.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Dokumentation.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/So_sind_wir.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Medley.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Bomberpilot_Live.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Wilde_Jungs.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Erinnerung_1987.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/bo3.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Zu_nah_an_der_Wahrheit.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/bo1.mp4", "https://nft.fra1.cdn.digitaloceanspaces.com/bo/Nichts_ist_fuer_die_Ewigkeit.mp4"]

// Wähle einen zufälligen Index basierend auf der Länge der Liste
random_index = floor(rnd * video_urls.len)

// Spiele das zufällige Video direkt aus der Liste ab
playVideo "Video(1)", video_urls[random_index], "oneshot", 1
