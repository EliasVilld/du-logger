function Log(name,ty)
    local self={}
    self.Name = name or 'Log'
    self.Value = (ty == 'int' and 0) or {}
    self.Type = ty or 'int'
    self.Id = 0
    
    if self.Type == 'range' then self.Value = {0,0} end

    function self.Update(v)
        self.Value[#self.Value] = v
    end

    function self.getString()
        if self.Type == 'int' then
            return self.value
        elseif self.Type == 'time' then
            return maths.round(self.getMean()*1000,4) .. 'ms'
        elseif self.Type == 'range' then
            return self.Value[1] .. '/' .. self.Value[2];
        end
    end
    
    function self.getValue()
        if self.Type == 'int' then
            return self.value
        elseif self.Type == 'time' then
            return self.getMean()
        elseif self.Type == 'range' then
            return self.Value[1];
        end
    end
        
    function self.addValue(v)
        if type(self.Value) ~= 'table' then self.Value = {} end
        table.insert(self.Value,1,v)
        if #self.Value > 200 then self.Value[201] = nil end
    end
    
    function self.getMean()
        local m = 0;
        for i=1,#self.Value do
            m = m + self.Value[i]
        end
        return m/#self.Value;
    end

    return self
end
