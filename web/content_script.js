const funcStatus = {
    clock: false,
    information: false
}

async function start() {
    await isTrueFromStorageLocal('clock').then((value) => {
        if (value) {
            setTimeout(function(){
                setClockElem()
            },3000)
        }
    })

    await isTrueFromStorageLocal('information').then((value) => {
        if (value) {
            setInformationElem()
        }
    })
}

function setClockElem() {
    funcStatus.clock = true
    if (!document.getElementsByClassName('timeElem').length) {
        let timeElem = document.createElement('div')
        timeElem.setAttribute("class", "timeElem")
        timeElem.style.margin = "2vw 4vw 0px"
        timeElem.style.fontSize = "8vw"
        timeElem.style.position = "absolute"
        timeElem.style.fontWeight = "bold"
        timeElem.style.fontFamily = "'YouTube Sans'"
        timeElem.style.textShadow = "black 0 0 5px"
        document.querySelectorAll('.html5-video-container')[0].append(timeElem)
        setInterval(function(){
            timeElem.innerHTML = new Date().getHours().toString() + ':' +  new Date().getMinutes().toString().padStart(2, '0')
        },1000)
    }
}

function setInformationElem() {
    funcStatus.information = true
    const elem = document.getElementsByClassName('html5-main-video')[0]
    var observer = new MutationObserver(() => changeSongInfo())
    observer.observe(elem, {
        attributes: true,
        childList: true,
        characterData: true
    })
}

function changeSongInfo() {
    if (!!document.getElementsByClassName('songInfoElement').length) {
      while (document.getElementsByClassName('songInfoElement').length) {
        document.getElementsByClassName('songInfoElement').item(0).remove()
      }
    }

    setTimeout(function(){
        if (!document.getElementsByClassName('songInfoElement').length) {
            let songInfoElement = document.createElement('div')
            songInfoElement.setAttribute("class", "songInfoElement")
            songInfoElement.style.margin = "4vw -100vw 0"
            songInfoElement.style.fontSize = "2.5vw"
            songInfoElement.style.fontWeight = "bold"
            songInfoElement.style.fontFamily = "'Roboto'"
            songInfoElement.style.position = "absolute"
            songInfoElement.style.color = "rgb(207 207 207 / 70%)"
            songInfoElement.style.textShadow = "rgba(0, 0, 0, 0.4) 0px 0px 3px"
            songInfoElement.style.transition = "all 0.5s"
            songInfoElement.innerHTML = '<img src="' + getURLFromInternalFolder('icons/youtube_logo.webp') + '" style="position: absolute;width: 3vw;left: -4vw;opacity: 0.5;margin-top: 0.5vw;">' +
            '# ' + document.querySelectorAll("#title h1 yt-formatted-string")[0].innerText + '<br>' + document.querySelectorAll('#text-container a')[0].text
            document.querySelectorAll('.html5-video-container')[0].append(songInfoElement)
            songInfoElement.style.display = "block"
            setTimeout(function(){
                songInfoElement.style.margin = funcStatus.clock ? "4vw 4vw 0px 29vw" : "4vw 4vw 0px 8vw"
            },1000)
        }
    },4000)
}

start()
