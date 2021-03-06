require! {
    \react
    \qrcode.react : QRCode
    \../get-primary-info.ls
}
.qrcode
    z-index: 9999999
module.exports = ({ store, address })->
    info = get-primary-info store
    return null if not address?
    bgColor = info.app.background
    fgColor = \#FFF
    .pug.qrcode
        QRCode.pug(value="#{address}" size="256" bgColor=bgColor fgColor=fgColor)