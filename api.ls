require! {
    \./providers.ls
    \mobx : { toJS }
    \prelude-ls : { pairs-to-obj, obj-to-pairs }
}
action = (func)-> (config, cb)->
    return cb "provider is not defined" if not config?network?api?provider?
    provider = providers[config.network.api.provider]
    return cb "providr not found for #{config.network.api.provider}" if not provider?
    func provider, config, cb
export calc-fee = action (provider, config, cb)->
    provider.calc-fee config, cb
export get-keys = action (provider, config, cb)->
    provider.get-keys config, cb
export get-balance = action (provider, config, cb)->
    provider.get-balance config, cb
export get-transactions = action (provider, config, cb)->
    provider.get-transactions config, cb
export create-transaction = action (provider, config, cb)->
    provider.create-transaction config, cb
export push-tx = action (provider, config, cb)->
    provider.push-tx config, cb
export get-transaction-info = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-transaction-info isnt \Function
    provider.get-transaction-info config, cb
#
#
#
#
export get-sync-status = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-sync-status isnt \Function
    provider.get-sync-status cb
export get-peer-count = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-peer-count isnt \Function
    provider.get-peer-count cb