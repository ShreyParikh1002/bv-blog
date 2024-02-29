import React from "react"
import ArticleListing from "./articlelisting"
import { BrowserRouter } from "react-router-dom"
import PluginList from "./pluginlisting"

export default function App() {
    return (
        <BrowserRouter>
            <ArticleListing/>
            <PluginList/>
        </BrowserRouter>
    )
}