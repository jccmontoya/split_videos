function start_timestamps = getTimestampVector(init_timestamp,end_timestamp,increment)
    start_timestamps = [];
    for i=init_timestamp:increment+1:end_timestamp
        start_timestamps = [start_timestamps, i];
    end
    
end