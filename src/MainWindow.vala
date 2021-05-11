/*-
 * Copyright (c) 2021 Fernando Casas Schössow (https://github.com/casasfernando/wingpanel-indicator-airpods)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Fernando Casas Schössow <casasfernando@outlook.com>
 */

namespace WingpanelAirPods {
    public class MainWindow : Gtk.Window {
        private GLib.Settings settings;

        public MainWindow (Gtk.Application application) {
            Object (
                application: application,
                border_width: 1,
                icon_name: "com.github.casasfernando.wingpanel-indicator-airpods",
                resizable: false, title: "Wingpanel AirPods",
                window_position: Gtk.WindowPosition.CENTER,
                default_width: 300
                );
        }

        construct {

            settings = new GLib.Settings ("com.github.casasfernando.wingpanel-indicator-airpods");
            var toggles = new TogglesWidget (settings);

            var layout = new Gtk.Grid ();
            layout.hexpand = true;
            layout.margin = 10;
            layout.column_spacing = 6;
            layout.row_spacing = 10;

            layout.attach (toggles, 0, 1, 1, 1);

            var header = new Gtk.HeaderBar ();
            header.show_close_button = true;

            var header_context = header.get_style_context ();
            header_context.add_class ("titlebar");
            header_context.add_class ("default-decoration");
            header_context.add_class (Gtk.STYLE_CLASS_FLAT);

            set_titlebar (header);
            add (layout);

        }

    }
}
