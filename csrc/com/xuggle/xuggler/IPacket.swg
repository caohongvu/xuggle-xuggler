/*******************************************************************************
 * Copyright (c) 2008, 2010 Xuggle Inc.  All rights reserved.
 *  
 * This file is part of Xuggle-Xuggler-Main.
 *
 * Xuggle-Xuggler-Main is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Xuggle-Xuggler-Main is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Xuggle-Xuggler-Main.  If not, see <http://www.gnu.org/licenses/>.
 *******************************************************************************/

%typemap (javacode) com::xuggle::xuggler::IPacket,com::xuggle::xuggler::IPacket*,com::xuggle::xuggler::IPacket& %{

  /**
   * info about this packet
   * @return information about this packet
   */
   
  @Override
  public String toString()
  {
    StringBuilder result = new StringBuilder();
    
    result.append(this.getClass().getName()+"@"+hashCode()+"[");
    result.append("complete:"+isComplete()+";");
    result.append("dts:"+getDts()+";");
    result.append("pts:"+getPts()+";");
    result.append("size:"+getSize()+";");
    result.append("key:"+isKey()+";");
    result.append("flags:"+getFlags()+";");
    result.append("stream index:"+getStreamIndex()+";");
    result.append("duration:"+getDuration()+";");
    result.append("position:"+getPosition()+";");
    IRational timeBase = getTimeBase();
    result.append("time base:"+timeBase+";");
    if (timeBase != null) timeBase.delete();
    result.append("]");
    return result.toString();
  }

%}

%include <com/xuggle/xuggler/IPacket.h>
