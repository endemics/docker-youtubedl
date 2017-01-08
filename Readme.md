# Docker-youtubedl

This repository allows you to build a docker image containing the youtube-dl binary, so that you can download songs and playlists from Youtube easily.

## Rationale for this docker image

I found I needed this as I have both a MacOSX machine and linux machines, and they had different versions of youtube-dl. It was difficult to maintain them up-to-date on Ubuntu/Debian when using the package and I didn't want to pollute my machines with pip-installed python stuff.

## Building

- You will need docker installed, access to the internet, and a copy of this repository.

- First open a terminal and move to the directory where you have the copy of the repository

- Then, type:

```bash
docker build  --no-cache -t youtube-dl .

```

- You should now have a docker image with the latest version of youtube-dl on your local docker!

## Using the docker youtube-dl image

### Displaying the help

You can obtain youtube-dl options via `docker run -ti --rm youtube-dl -h`

### Downloading

The image use volumes to mount the local directory, where it will download the files.

You can either download using the full URL
`docker run -ti --rm -v $PWD:/data youtube-dl 'https://www.youtube.com/watch?v=N4w4k'`
or using the key for the file (the value on the right of the `v=` in the URL)
`docker run -ti --rm -v $PWD:/data youtube-dl N4w4k`

It also works for Playlists!

`docker run -ti --rm -v $PWD:/data youtube-dl PL_N4w4k`

### Adding an alias

I find it more convenient to be able to type `youtubedl N4w4k`, instead of
having to remember everything, so I've added the following alias to my shell:

```bash
alias youtubedl='docker run -ti --rm -v $PWD:/data youtube-dl'
```

## Modifying

If you want to change the default options of youtube-dl when started,
you can either modify the `ENTRYPOINT` line in the `Dockerfile`,
or if you want to add a missing option, just add it to the docker line after
the image name and before the video reference as such:

```bash
docker run -ti --rm -v $PWD:/data youtube-dl --my-missing-option N4w4k
```
