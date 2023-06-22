async function isEnableExtension() {
    let result = await chrome.tabs.query({
        active: true,
        currentWindow: true
    }).then(tabs => {
        return (new URL(tabs[0].url).hostname === 'www.youtube.com')
    })

    return result
}

async function setStorageLocal(key, value) {
    await chrome.storage.local.set({[key]: value}, () => {})
}

async function isTrueFromStorageLocal(key) {
    let result = await getStorageLocal(key)
    return !!JSON.parse(result[key])
}

async function getStorageLocal(key) {
    let result = await chrome.storage.local.get(key).then(value => {
        return value
    })
    return result
}

function reloadTab() {
    chrome.tabs.reload()
    chrome.runtime.reload()
}

function getURLFromInternalFolder(path) {
    return chrome.runtime.getURL(path)
}
