require! {
    \react
    \../components/button.ls
    \../themes.ls
    \prelude-ls : { obj-to-pairs, map }
}
#monochrome dark_mojave
.choose-theme
    >.theme
        margin-bottom: 40px
        display: inline-block
        width: 200px
        >.pallete
            .box
                display: inline-block
                width: 40px
                height: 40px
                text-align: top
                box-sizing: border-box
create-button = (store, web3t)-> (text)->
    use = ->
        web3t.set-theme text
    background-style=
        background: themes[text].background
    button-style=
        background: themes[text].primary1
    control-style=
        background: themes[text].addressBg
    .pug.theme
        .pug.pallete
            .box.pug(style=background-style)
            .box.pug(style=button-style)
            .box.pug(style=control-style)
        button { store, text , on-click: use, icon: \show, type: \secondary }
module.exports = (store, web3t)->
    .pug.choose-theme
        themes |> obj-to-pairs |> map (-> it.0) |> map create-button store, web3t