resource "spotify_playlist" "Heartbeat" {
  name        = "Heartbeat"
  description = "My playlist is for sweet songs"
  public      = true

  tracks = [
    data.spotify_track.lovestory.id,
    data.spotify_track.Diewithasmile.id,
    data.spotify_track.springsnow.id,
    data.spotify_track.anuvanuvuu.id,
  ]
}

data "spotify_track" "lovestory" {
  url = "https://open.spotify.com/track/6nGeLlakfzlBcFdZXteDq7"
}
data "spotify_track" "Diewithasmile" {
  url = "https://open.spotify.com/track/2plbrEY59IikOBgBGLjaoe"
}
data "spotify_track" "springsnow" {
  url = "https://open.spotify.com/track/0tCr7DoUBSdtdSl0rxZmct"
}
data "spotify_track" "anuvanuvuu" {
  url = "https://open.spotify.com/track/0kNe3kmRFq7eKVlL15h7nb"
}
