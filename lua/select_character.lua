-- 以词定字
-- 功能说明：
-- 1）通过配置的按键，快速从词组中取首字或尾字上屏；
-- 2）新增“名字键”：当词组长度≥3时，按该键将提交该词的最后两个字（中文语境下常用于取人名中的“名字”部分）。

local wanxiang = require("wanxiang")

local select = {}

function select.init(env)
    -- 函数作用：初始化读取配置中的快捷键
    -- 小白话术：启动时从方案配置里把三个键位读出来，后面按键时我们就知道该做什么
    local config = env.engine.schema.config
    select.first_key = config:get_string('key_binder/select_first_character')
    select.last_key = config:get_string('key_binder/select_last_character')
    -- 新增：读取“名字键”，用于取最后两个字
    -- 你需要在方案的 key_binder 里添加对应的键位字符串
    select.name_key = config:get_string('key_binder/select_name_characters')
end

function select.func(key, env)
    -- 函数作用：处理按键事件，根据不同键位执行取首字、取尾字或取“名字”（最后两字）
    -- 小白话术：当你按下配置好的键，如果当前有正在输入或候选词，就把相应的字（或两个字）上屏并清空输入状态
    local engine = env.engine
    local context = env.engine.context

    if
        not key:release()
        and (context:is_composing() or context:has_menu())
        and (select.first_key or select.last_key or select.name_key)
    then
        local text = context.input
        if context:get_selected_candidate() then
            text = context:get_selected_candidate().text
        end
        if utf8.len(text) > 1 then
            if (key:repr() == select.first_key) then
                engine:commit_text(text:sub(1, utf8.offset(text, 2) - 1))
                context:clear()
                return wanxiang.RIME_PROCESS_RESULTS.kAccepted
            elseif (key:repr() == select.last_key) then
                engine:commit_text(text:sub(utf8.offset(text, -1)))
                context:clear()
                return wanxiang.RIME_PROCESS_RESULTS.kAccepted
            -- 新增：“名字键”逻辑：当词长≥3，取最后两个字
            elseif (select.name_key and key:repr() == select.name_key and utf8.len(text) >= 3) then
                local start = utf8.offset(text, -2)
                engine:commit_text(text:sub(start))
                context:clear()
                return wanxiang.RIME_PROCESS_RESULTS.kAccepted
            end
        end
    end
    return wanxiang.RIME_PROCESS_RESULTS.kNoop
end

return select
