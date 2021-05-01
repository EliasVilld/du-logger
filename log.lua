function Log(name,ty)
    local self={}
    self.Name = name or 'Log'
    self.Value = (ty == 'number' and 0) or {}
    self.Type = ty or 'mean'

    function self.Update(v)
        if self.Type == 'number' then
            self.Value = v
        else
            self.Value[#self.Value] = v
        end
    end

    function self.getString()
        if self.Type == 'number' then
            return tostring(self.Value)
        elseif self.Type == 'time' then
            return maths.round(self.getMean()*1000,4) .. 'ms'
        elseif self.Type == 'mean' then
            return tostring(maths.round(self.getMean(),2));
        end
    end
    
    function self.getValue()
        if self.Type == 'number' then
            return self.value
        else
            return self.getMean()
        end
    end
        
    function self.addValue(v)
        if self.Type == 'number' then return end
        
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
