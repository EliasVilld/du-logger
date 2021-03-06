function Logger()
    local self={}
    self.Logs={}

    function self.CreateLog(name,type)
        local log = Log(name,type)
        Register(log)
        return log;
    end
    
    function self.getLogs()
        local logs = {}
        for _,l in pairs(self.Logs) do
            logs[#logs+1] = l.Name .. ': ' .. l.getString()
        end
        return logs
    end
    
    function Register(log)
        self.Logs[#self.Logs+1] = log;
    end
    return self
end
