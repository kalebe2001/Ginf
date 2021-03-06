--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-05-27 20:01:13 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16827)
-- Name: Adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Adm" (
    ds_senha character varying,
    "nm_nicknameAdm" character varying(30) NOT NULL
);


ALTER TABLE "Adm" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16830)
-- Name: Ban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Ban" (
    ds_justificativa character varying,
    "nm_nomeBanido" character varying(30),
    nm_aviso character varying
);


ALTER TABLE "Ban" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16818)
-- Name: Forum/Video; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Forum/Video" (
    id_post character varying,
    id_comentario character varying,
    dt_data date,
    nm_comentarista character varying(30)
);


ALTER TABLE "Forum/Video" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16824)
-- Name: Noticias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Noticias" (
    id_noticia character varying,
    id_comentario character varying,
    dt_data date,
    "nm_comentaristaNoticia" character varying(30)
);


ALTER TABLE "Noticias" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16821)
-- Name: Publicador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Publicador" (
    ds_senha character varying,
    "nm_nicknamePub" character varying(30) NOT NULL
);


ALTER TABLE "Publicador" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16815)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Usuario" (
    ds_senha character varying(30),
    ds_email character varying,
    nm_nome_real character varying(50),
    "nm_nicknameUser" character varying(20) NOT NULL
);


ALTER TABLE "Usuario" OWNER TO postgres;

--
-- TOC entry 2177 (class 0 OID 16827)
-- Dependencies: 185
-- Data for Name: Adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Adm" (ds_senha, "nm_nicknameAdm") FROM stdin;
\.


--
-- TOC entry 2178 (class 0 OID 16830)
-- Dependencies: 186
-- Data for Name: Ban; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Ban" (ds_justificativa, "nm_nomeBanido", nm_aviso) FROM stdin;
\.


--
-- TOC entry 2174 (class 0 OID 16818)
-- Dependencies: 182
-- Data for Name: Forum/Video; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Forum/Video" (id_post, id_comentario, dt_data, nm_comentarista) FROM stdin;
\.


--
-- TOC entry 2176 (class 0 OID 16824)
-- Dependencies: 184
-- Data for Name: Noticias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Noticias" (id_noticia, id_comentario, dt_data, "nm_comentaristaNoticia") FROM stdin;
\.


--
-- TOC entry 2175 (class 0 OID 16821)
-- Dependencies: 183
-- Data for Name: Publicador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Publicador" (ds_senha, "nm_nicknamePub") FROM stdin;
\.


--
-- TOC entry 2173 (class 0 OID 16815)
-- Dependencies: 181
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Usuario" (ds_senha, ds_email, nm_nome_real, "nm_nicknameUser") FROM stdin;
\.


--
-- TOC entry 2052 (class 2606 OID 16860)
-- Name: pk_nicknameAdm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Adm"
    ADD CONSTRAINT "pk_nicknameAdm" PRIMARY KEY ("nm_nicknameAdm");


--
-- TOC entry 2048 (class 2606 OID 16862)
-- Name: pk_nicknamePub; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Publicador"
    ADD CONSTRAINT "pk_nicknamePub" PRIMARY KEY ("nm_nicknamePub");


--
-- TOC entry 2044 (class 2606 OID 16858)
-- Name: pk_nicknameUser; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuario"
    ADD CONSTRAINT "pk_nicknameUser" PRIMARY KEY ("nm_nicknameUser");


--
-- TOC entry 2045 (class 1259 OID 16868)
-- Name: fki_comentarista; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_comentarista ON "Forum/Video" USING btree (nm_comentarista);


--
-- TOC entry 2046 (class 1259 OID 16874)
-- Name: fki_comentaristaAdm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_comentaristaAdm" ON "Forum/Video" USING btree (nm_comentarista);


--
-- TOC entry 2049 (class 1259 OID 16885)
-- Name: fki_comentaristaNoticia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_comentaristaNoticia" ON "Noticias" USING btree ("nm_comentaristaNoticia");


--
-- TOC entry 2050 (class 1259 OID 16891)
-- Name: fki_comentaristaNoticiaAdm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_comentaristaNoticiaAdm" ON "Noticias" USING btree ("nm_comentaristaNoticia");


--
-- TOC entry 2053 (class 1259 OID 16903)
-- Name: fki_nomeBanido; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_nomeBanido" ON "Ban" USING btree ("nm_nomeBanido");


--
-- TOC entry 2054 (class 2606 OID 16863)
-- Name: fk_comentarista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Forum/Video"
    ADD CONSTRAINT fk_comentarista FOREIGN KEY (nm_comentarista) REFERENCES "Usuario"("nm_nicknameUser");


--
-- TOC entry 2055 (class 2606 OID 16869)
-- Name: fk_comentaristaAdm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Forum/Video"
    ADD CONSTRAINT "fk_comentaristaAdm" FOREIGN KEY (nm_comentarista) REFERENCES "Adm"("nm_nicknameAdm");


--
-- TOC entry 2056 (class 2606 OID 16880)
-- Name: fk_comentaristaNoticia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Noticias"
    ADD CONSTRAINT "fk_comentaristaNoticia" FOREIGN KEY ("nm_comentaristaNoticia") REFERENCES "Usuario"("nm_nicknameUser");


--
-- TOC entry 2057 (class 2606 OID 16886)
-- Name: fk_comentaristaNoticiaAdm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Noticias"
    ADD CONSTRAINT "fk_comentaristaNoticiaAdm" FOREIGN KEY ("nm_comentaristaNoticia") REFERENCES "Adm"("nm_nicknameAdm");


--
-- TOC entry 2058 (class 2606 OID 16898)
-- Name: fk_nomeBanido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ban"
    ADD CONSTRAINT "fk_nomeBanido" FOREIGN KEY ("nm_nomeBanido") REFERENCES "Usuario"("nm_nicknameUser");


--
-- TOC entry 2185 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-05-27 20:01:13 BRT

--
-- PostgreSQL database dump complete
--

